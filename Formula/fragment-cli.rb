require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.8.29-darwin-x64.tar.gz"
    sha256 "a373b5cf7e94751bf1764b42a5d2558f954cd9419ca97ddbf29ef5cd82bf9c56"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.8.29-darwin-arm64.tar.gz"
      sha256 "4a1484c5f07d6558de2df971943460dec94c3edf0d3822173af522bcc874c6b4"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.8.29-linux-x64.tar.gz"
    sha256 "3c550b2ec68ffc83d1a4f2c2289489acc29d3b33149dfa9b9f6b14cc8a368f2c"
  end
  version "2024.8.29"
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
