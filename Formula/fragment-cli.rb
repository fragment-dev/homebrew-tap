require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.21-1-darwin-x64.tar.gz"
    sha256 "f0f7febc311fdc8594946ba08fbf7efd162853ba0648ef52e3538d721b0f86ad"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.21-1-darwin-arm64.tar.gz"
      sha256 "5d937a12b3c47fe0586f0833999df18d245d21ce73dd9e0ddd805560329c6558"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.21-1-linux-x64.tar.gz"
    sha256 "0837cf6b44cb7b6902b316c9f4ae94e52439cd9af2224d73fe1284cea772d157"
  end
  version "2024.2.21-1"
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
