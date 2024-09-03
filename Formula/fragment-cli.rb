require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.9.3-darwin-x64.tar.gz"
    sha256 "e3647026bc1c77939b6824e876d80bff755974334b9982ed3465bf1cd7588a91"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.9.3-darwin-arm64.tar.gz"
      sha256 "b8bb5bc27375a5640466e5950642ff4ed0dbdc0da954df8502edc860e373bc1b"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.9.3-linux-x64.tar.gz"
    sha256 "74f8f40e22896d4085c4b6122e64f0ee6f1b7690155e1b728940ba4ba57a7519"
  end
  version "2024.9.3"
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
