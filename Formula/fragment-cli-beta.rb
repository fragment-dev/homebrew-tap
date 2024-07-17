require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5403.0.0-darwin-x64.tar.gz"
    sha256 "a4513c785e1f948fc7f127f5aa29dc34370774c697fa3323551c5b514e5acfee"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5403.0.0-darwin-arm64.tar.gz"
      sha256 "52f352f6f3b4ed7e6a5c0ed4ce98bd411b3317a1ab80e059f1571ba9bc6b8914"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5403.0.0-linux-x64.tar.gz"
    sha256 "f1d9bc930b38b3e62a4ce0a078c68e63a0317d078b4c28cd3f0206942e845e21"
  end
  version "5403.0.0"
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
