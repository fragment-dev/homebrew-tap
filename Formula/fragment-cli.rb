require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.8.20-darwin-x64.tar.gz"
    sha256 "92251d4f38b91478ab5affc604c487443bdbea688afb5236399a3cba09b12f5e"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.8.20-darwin-arm64.tar.gz"
      sha256 "1ad16fc88f5888df3285fd85e624e2adb38741425ed39410b9828ec6bd942114"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.8.20-linux-x64.tar.gz"
    sha256 "5944ac4529d15cbf70ff6fe22a203205681a986c9bee9c9a48860a3ac6739723"
  end
  version "2024.8.20"
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
