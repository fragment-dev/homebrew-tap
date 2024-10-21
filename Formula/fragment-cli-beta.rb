require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5681.0.0-darwin-x64.tar.gz"
    sha256 "dcc321b6da57d6fdcbe66a3cda72151f32922cf6105258c80903f9b7b7d7c1db"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5681.0.0-darwin-arm64.tar.gz"
      sha256 "8e68512be9722e2b5556a631115dbf566dc7d1259412693e9525da6fec54b063"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5681.0.0-linux-x64.tar.gz"
    sha256 "7d42c7d07bcbd6bdf5fa562555be1bf79c5169b4fd5350ae534e945383ef6003"
  end
  version "5681.0.0"
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
