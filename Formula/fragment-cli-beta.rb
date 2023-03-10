require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2172.0.0-darwin-x64.tar.gz"
    sha256 "a4efaaa8d956a839b22518ffaf3f46d695e106cee23e3f26a1873340ae19eed6"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2172.0.0-darwin-arm64.tar.gz"
      sha256 "92e8e48d44c7e98b0074e299bc1c68ebee3101609338b101c986b8677ed1e11c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2172.0.0-linux-x64.tar.gz"
    sha256 "0129db94663b785e4749c643922906e7a6e236277add5aa9f658c6cc6870972f"
  end
  version "2172.0.0"
  license "MIT"
  depends_on "node@16"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
