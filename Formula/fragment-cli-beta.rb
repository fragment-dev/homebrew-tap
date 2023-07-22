require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3150.0.0-darwin-x64.tar.gz"
    sha256 "af3f0a148ccc6cf246df170b660c8daae4803643d27b106a2597a649ee7ddb84"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3150.0.0-darwin-arm64.tar.gz"
      sha256 "87ebfb871263a465441f25e8c9814948976eabbbb36457243b31731c3f6f3bfa"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3150.0.0-linux-x64.tar.gz"
    sha256 "7ee68795f50c2cac944ac5de918a2a7e630756d8b0e79de82cdc08002928080e"
  end
  version "3150.0.0"
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
