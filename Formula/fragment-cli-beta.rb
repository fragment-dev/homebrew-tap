require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3442.0.0-darwin-x64.tar.gz"
    sha256 "4d1a248bf3d95ecffc1d2880cfdffd1dfc34745d8b034f6ecd88744669ee2f2a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3442.0.0-darwin-arm64.tar.gz"
      sha256 "be866899d6fe044363bd7fa938cc43c346895c7e15c8a703353c7eca07ca6215"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3442.0.0-linux-x64.tar.gz"
    sha256 "53ce6db2d110820895996c40d7cce02b472353bcb14ff75617cc873b7901c9f8"
  end
  version "3442.0.0"
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
