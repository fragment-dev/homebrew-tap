require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3481.0.0-darwin-x64.tar.gz"
    sha256 "50c26effb64e278bbd4210ddb37f2da07b2cd9542b0e0c0a44cda7d40aaa182d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3481.0.0-darwin-arm64.tar.gz"
      sha256 "9d471466090590bfdf590c77c59f8037ca4bf48b8758d1873b13ea2afec5e1a5"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3481.0.0-linux-x64.tar.gz"
    sha256 "c0387c0632df6d711fcd3c25557aedcc4c2e008d5d09debb1441dabab7e10a7f"
  end
  version "3481.0.0"
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
