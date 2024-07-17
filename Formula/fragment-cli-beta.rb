require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5406.0.0-darwin-x64.tar.gz"
    sha256 "408334144991ed1d377454c507f73b94ea0dd735c7e0036ebcbf1de12fdc1ad2"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5406.0.0-darwin-arm64.tar.gz"
      sha256 "dad91227627e2563e1a2adde10cc65c337f97099896a37cd66b769067696cb00"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5406.0.0-linux-x64.tar.gz"
    sha256 "8a9fe6912fa21777c4c97273b094e2d837c68bd3dc2191682df766c7fc1029bd"
  end
  version "5406.0.0"
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
