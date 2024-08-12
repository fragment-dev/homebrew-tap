require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5499.0.0-darwin-x64.tar.gz"
    sha256 "0f6ecd17a6f75016252cbce640601228b0724aceeffca492ec0783fb5600d24b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5499.0.0-darwin-arm64.tar.gz"
      sha256 "dfe002dc96b2aa78ce0a82a1bb3bb04c4189966c8d8b724dcbc37abd8d185ad4"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5499.0.0-linux-x64.tar.gz"
    sha256 "8917978d17072e567046245e60489cc8e3534d12554f1cff0e052d1a057f4107"
  end
  version "5499.0.0"
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
