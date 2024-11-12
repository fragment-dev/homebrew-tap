require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5762.0.0-darwin-x64.tar.gz"
    sha256 "37feea4efa476caec9f2a51d26f29624f11a0886bb476d203443798f5dc6a754"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5762.0.0-darwin-arm64.tar.gz"
      sha256 "147341779dd25a873148efa9823dd578f5f62b1136b7b4a0571b2fd4c52bb8c0"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5762.0.0-linux-x64.tar.gz"
    sha256 "91d599467ea87ca651dcc49655fa683a098b468df1da6955071fd2fab77e37c0"
  end
  version "5762.0.0"
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
