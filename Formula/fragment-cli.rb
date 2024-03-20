require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.3.20-darwin-x64.tar.gz"
    sha256 "fee1b46448db6da1efebca8ca87e4ec7ec0c8f1b05da5aba7f79856a48bc6607"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.3.20-darwin-arm64.tar.gz"
      sha256 "5700f2cd8d49c54e81dc7087e9dc22dea808c9ef8331ab9a19fa2edfee4fe6db"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.3.20-linux-x64.tar.gz"
    sha256 "69c723c37d8d1707f292e25d7ba3827e728662ce62cf452a0854747a1d1c97b1"
  end
  version "2024.3.20"
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
