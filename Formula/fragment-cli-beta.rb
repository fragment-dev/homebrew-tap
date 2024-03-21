require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4799.0.0-darwin-x64.tar.gz"
    sha256 "c5a2561e92312ddf2353abfdcb2b077abd944396202bc472fba8e8cc26dc753c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4799.0.0-darwin-arm64.tar.gz"
      sha256 "2344623324641b4f5a00ea9651321db746563f61cc7e2d2bf3edb2c7f6a9a3b0"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4799.0.0-linux-x64.tar.gz"
    sha256 "1fa7e842466ddcb3886f5da81590ea5bd09b3863634a7b81da4c63cc802b1fbc"
  end
  version "4799.0.0"
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
