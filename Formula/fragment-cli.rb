require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.1-1-darwin-x64.tar.gz"
    sha256 "ff8053b5a925b756c204b0dd927d7fb8cf2e6202bc5cb566dfebcd5fc9426257"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.1-1-darwin-arm64.tar.gz"
      sha256 "c4efd33300e719916a0b9cf6dd7a75e121a6da36c7a253fbfdb377116e6b12eb"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.1-1-linux-x64.tar.gz"
    sha256 "47475995e891ffd519b3ca6f289d21daf25011a7f81ae08faea027273aabc407"
  end
  version "2024.1.1-1"
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
