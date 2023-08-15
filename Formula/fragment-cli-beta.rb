require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3308.0.0-darwin-x64.tar.gz"
    sha256 "62d55bc7b04f2cd255b0a4c9f30c3603eff95266ad2dfa84ba6ce0c6e2502f0e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3308.0.0-darwin-arm64.tar.gz"
      sha256 "930d7dd84fd8db1dc8da465e5fb0be55c5dbd8c83943781da5370ace6e8e90e0"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3308.0.0-linux-x64.tar.gz"
    sha256 "3b4cc01d353924984a2295a7a2c9ae500c0f8ce532ecba14c3985aa8be615467"
  end
  version "3308.0.0"
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
