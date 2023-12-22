require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4202.0.0-darwin-x64.tar.gz"
    sha256 "9fbcd73976ee5d258a60f1143175bda27eed5ef488f2ae7021a07c316d12c1c0"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4202.0.0-darwin-arm64.tar.gz"
      sha256 "85b8383d13ae2206d71906d00abe30a6482bec696160be7a15870428643b7415"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4202.0.0-linux-x64.tar.gz"
    sha256 "48a1566c044ec746ed6f5c7f72990e641c4f5f4c4b9c3a1e89fd375aa80e7b3b"
  end
  version "4202.0.0"
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
