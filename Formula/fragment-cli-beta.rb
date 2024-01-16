require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4339.0.0-darwin-x64.tar.gz"
    sha256 "2792e0eda19db20a1467a52a2b036755412ee855e0447e81095479000571a6ad"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4339.0.0-darwin-arm64.tar.gz"
      sha256 "8c3527a0ae1168a52f4397573b4b7e3465827dce642c141ac405d8cc427159d4"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4339.0.0-linux-x64.tar.gz"
    sha256 "c9638b3c69a1e11414012082c2d82212cbef0ef0296888dbdaac222cdd786b6b"
  end
  version "4339.0.0"
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
