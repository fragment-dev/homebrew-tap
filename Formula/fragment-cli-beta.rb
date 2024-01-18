require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4366.0.0-darwin-x64.tar.gz"
    sha256 "1ea27588b462b24f402292dfd6efae1cf56f8a8e3546e3a99f12517542095907"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4366.0.0-darwin-arm64.tar.gz"
      sha256 "1d554186bc6e74652becc7bd9cdc44886351edfdddfd83d08239197ed0caf483"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4366.0.0-linux-x64.tar.gz"
    sha256 "b9503220038324898ddc48f4f4065341327bf8da2680325cd3e14bb318bbf557"
  end
  version "4366.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
