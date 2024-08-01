require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.8.1-darwin-x64.tar.gz"
    sha256 "66d462620dfcdaec4c7a940ce114adcc8fc6a69b417d50ab8c140f5fc3104cd1"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.8.1-darwin-arm64.tar.gz"
      sha256 "0b6ec532fe5613838acf0bbc3bf5ebd5882a35a0622529b018a3f32f44ce49a0"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.8.1-linux-x64.tar.gz"
    sha256 "1121f5fad93387f2dfca9dfa1fe677ff0d34a9a735c1449382c306de7bd1698a"
  end
  version "2024.8.1"
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
