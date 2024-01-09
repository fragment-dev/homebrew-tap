require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4293.0.0-darwin-x64.tar.gz"
    sha256 "dd2931233fbc8f9c5b618b724313677c29bab46fcb44da12ac1745cd20925130"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4293.0.0-darwin-arm64.tar.gz"
      sha256 "462dd8235e371353fb9f1df1ffa31c16cbd5e8c4d48b9e299f68083d32ae8400"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4293.0.0-linux-x64.tar.gz"
    sha256 "192a48f2e9ffa87cb8cedc7e9d142096dbff36e123294ff093ae5ca1ffb7f9ad"
  end
  version "4293.0.0"
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
