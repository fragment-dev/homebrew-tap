require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6102.0.0-darwin-x64.tar.gz"
    sha256 "a48210f5ec4f4eed90171e8d338a7d15490534c7a9f9c151fb2ca60ce869f4da"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6102.0.0-darwin-arm64.tar.gz"
      sha256 "a499f30722869cde692ceee35e1021855a30e01d88704bd1c1d68de901c71b7b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6102.0.0-linux-x64.tar.gz"
    sha256 "02393ae598bbee81e998be2b7f93c7f150ca8378ce12ae0feb2798c1ee7a6d88"
  end
  version "6102.0.0"
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
