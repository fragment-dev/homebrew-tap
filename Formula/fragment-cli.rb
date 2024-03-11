require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.3.8-darwin-x64.tar.gz"
    sha256 "df0d5ee0d408fd09ffeefd330ef87811c7b757bb9cc67140b736904a116ab345"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.3.8-darwin-arm64.tar.gz"
      sha256 "783320e984326e11b7cad618200518e8aced5faee26dbf1c1cc417950f9010e7"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.3.8-linux-x64.tar.gz"
    sha256 "a07b93008e14b633d81ebc527f090aa5b2f8b77540b359f86aee04eb4801c676"
  end
  version "2024.3.8"
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
