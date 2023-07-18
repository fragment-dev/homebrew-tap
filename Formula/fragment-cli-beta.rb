require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3113.0.0-darwin-x64.tar.gz"
    sha256 "5f92d240457dfb9463efde2537e184e42fec2390bd4fc5a41a72efd704588df1"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3113.0.0-darwin-arm64.tar.gz"
      sha256 "e5394cfab2a9b74646a81d0ce67267962e9d6095ad11c65058170c2fa968c961"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3113.0.0-linux-x64.tar.gz"
    sha256 "25dcca1fd24ca76ae416197c4088e78ff07dd95c7c8dbd4a09377d1313010b08"
  end
  version "3113.0.0"
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
