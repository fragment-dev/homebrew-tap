require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4524.0.0-darwin-x64.tar.gz"
    sha256 "0a7e9426e7a2048cadeab82853a99cf51dd9e3b83197af38f433dcd0782fedbd"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4524.0.0-darwin-arm64.tar.gz"
      sha256 "6d1766a04daf914befc14a780213470b31d9539c047379df49cb8f10ecbfb70c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4524.0.0-linux-x64.tar.gz"
    sha256 "c103eec7f81ad38f936d8b49347db635e4167870cae2172152a63369c4c1784c"
  end
  version "4524.0.0"
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
