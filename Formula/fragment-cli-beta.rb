require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4101.0.0-darwin-x64.tar.gz"
    sha256 "2976dd8483bfd95262e528aa1018ccdad8d36701a0da8eedb41cc56b9031a923"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4101.0.0-darwin-arm64.tar.gz"
      sha256 "9268767d2b7716fdef7e83e8190f58b1e77b301c4e48772b30958da55b228b2b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4101.0.0-linux-x64.tar.gz"
    sha256 "a42322c70c8906c4e03046476bd5e640c40ecab68417828ddad238a6fad8c0ca"
  end
  version "4101.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
