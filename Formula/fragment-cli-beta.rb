require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4939.0.0-darwin-x64.tar.gz"
    sha256 "58cdb34fb63f9df17c206f81c1c0c3327d8369445f6559fd0a9ac06607fe3c9e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4939.0.0-darwin-arm64.tar.gz"
      sha256 "199d1bbeb1056f50c5f85b8318aa3ad12aa829d8564eaeac82b6b789d54f8f76"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4939.0.0-linux-x64.tar.gz"
    sha256 "bf7043421cc06800e9f366c81e3a4ab5290321249aa6b33769855dddce78dbd4"
  end
  version "4939.0.0"
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
