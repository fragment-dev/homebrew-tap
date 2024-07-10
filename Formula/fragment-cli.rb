require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.7.9-2-darwin-x64.tar.gz"
    sha256 "66782111484e0f4f8ea3ed787df16c6091c245af5b64e11ce452b55965960d1f"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.7.9-2-darwin-arm64.tar.gz"
      sha256 "c56a8fe7cbd9d9b70bd988b9587b072cd2c22453028f72d64f9af49fffad8140"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.7.9-2-linux-x64.tar.gz"
    sha256 "fd874ac4148c90899cdbddfd929f5b5fc50eb534f07703221f4ca23e5d5900bf"
  end
  version "2024.7.9-2"
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
