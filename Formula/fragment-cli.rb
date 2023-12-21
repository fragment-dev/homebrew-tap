require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.12.21-darwin-x64.tar.gz"
    sha256 "b93f2bbe0a0de1a2478e0fe444e8af816ec124a2d67bd5f3f78897d7c91e9b61"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.12.21-darwin-arm64.tar.gz"
      sha256 "0ab45476d8013c7364592da1b158693327bc17d6cbcf1bffa5a96659db40fbd9"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.12.21-linux-x64.tar.gz"
    sha256 "5ba3dbbbf9e28bff5d7e965d8b5cd08b10996af7e7b3f94e9a123f8a60623728"
  end
  version "2023.12.21"
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
