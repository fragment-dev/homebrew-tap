require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.9-darwin-x64.tar.gz"
    sha256 "735962d2c1f2352b3b8786790664e3dc5a7faa1515937395d1d6926bfda8a745"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.9-darwin-arm64.tar.gz"
      sha256 "2ad28b627bb7485c93485b21b1ca363ed0b7977dabeb820f4fa8dd9e4340c779"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.9-linux-x64.tar.gz"
    sha256 "338aa973a3910037261d37820265f80b59decd9b6992953be37c23ca655920f3"
  end
  version "2024.2.9"
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
