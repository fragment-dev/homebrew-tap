require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.2-darwin-x64.tar.gz"
    sha256 "d6c790672a006a66bd80c364769fe41dd1862f77022fb7e8564d7ad26345eb1f"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.2-darwin-arm64.tar.gz"
      sha256 "613559be8f9e03ca680beafdab789700eaa55e85492732645c8576818e8af702"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.2-linux-x64.tar.gz"
    sha256 "64a26942a869ae313f29e9162365bc71c0b46058b26b218e6bce6db9067e2e5d"
  end
  version "2024.1.2"
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
