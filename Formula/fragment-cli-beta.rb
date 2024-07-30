require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5448.0.0-darwin-x64.tar.gz"
    sha256 "893552946499bd7d38eb739c293c954f1b27d24cc23c2d63ef4d8d758c5a868f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5448.0.0-darwin-arm64.tar.gz"
      sha256 "c02ece95e026995fc34021414795f262d88506e450998e0a1ab65f89c0222d1d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5448.0.0-linux-x64.tar.gz"
    sha256 "2f11cf2ae4f06ce55594cafc78793ac8aefe8d5e06f7a7a8e3555f28c918551a"
  end
  version "5448.0.0"
  license "MIT"
  depends_on "node@20"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
