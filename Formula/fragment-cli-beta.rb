require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5619.0.0-darwin-x64.tar.gz"
    sha256 "e4e9c8ca1b8496de3837405fc9d25d29ed663221b7b88a7ad72564ab8d214f04"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5619.0.0-darwin-arm64.tar.gz"
      sha256 "eb1dccaecdcf7b3e674b49d088b27a85ae7f4ab2eefac551a38b889376965528"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5619.0.0-linux-x64.tar.gz"
    sha256 "a3891cb549461e379bf6aca903ad6124d0f5c3441676cc1d27bfa0f28586ecf6"
  end
  version "5619.0.0"
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
