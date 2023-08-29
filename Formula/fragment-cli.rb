require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.8.29-3-darwin-x64.tar.gz"
    sha256 "17860ee1077d11c9e06c6f1c61da66290bc192c71973b98bcc77094c5b6736fe"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.8.29-3-darwin-arm64.tar.gz"
      sha256 "c9084263e5c1cf077fe471b292abbaf2cbd9268b8aa3c55eddfd4d0e74c1cd0b"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.8.29-3-linux-x64.tar.gz"
    sha256 "5af2f9b9edd1981a72addb1a98096862312850b749569fdfd43cc4dd19efb321"
  end
  version "2023.8.29-3"
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
