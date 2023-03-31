require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2331.0.0-darwin-x64.tar.gz"
    sha256 "ef99dbacdadc2c99a2acb9fa60eaa777f6723037f5bbc8a202468f1b1b7dae42"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2331.0.0-darwin-arm64.tar.gz"
      sha256 "a22800ba56162118751397a7db9cb57c906b4d18fb233520f1b2937187efd42f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2331.0.0-linux-x64.tar.gz"
    sha256 "5525fc513d8bc581e7f2bf678eb8f086f0904f2be204be680da7e3e89ed16e14"
  end
  version "2331.0.0"
  license "MIT"
  depends_on "node@16"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
