require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5394.0.0-darwin-x64.tar.gz"
    sha256 "df214f32f81052d1fb9d6193e915540b562ad09b8203383d79245763d91ee48a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5394.0.0-darwin-arm64.tar.gz"
      sha256 "b1a1fb9aa0b07f1cddac79941a3dd8bc435bc720cbf35c4c9e7826c3bfab17ec"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5394.0.0-linux-x64.tar.gz"
    sha256 "4fb49db473ceb7b5147ba944db6f8452fd977c37953873ed0c4a30e3284b25f4"
  end
  version "5394.0.0"
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
