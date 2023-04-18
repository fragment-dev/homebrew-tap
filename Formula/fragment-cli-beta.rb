require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2463.0.0-darwin-x64.tar.gz"
    sha256 "ccd5646e3dc74382d1dcd9468a0ce06e6422924e9d1383356aefce838881fbec"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2463.0.0-darwin-arm64.tar.gz"
      sha256 "60caca73fc506218019ac3991594e8662aabf2f0bea69b7a7e4a054bc1041a50"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2463.0.0-linux-x64.tar.gz"
    sha256 "60b53e580b744412d5d738f2c833d395a0434f3b0be2bab531c8431afe0297bc"
  end
  version "2463.0.0"
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
