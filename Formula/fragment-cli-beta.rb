require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2939.0.0-darwin-x64.tar.gz"
    sha256 "6418a8ae82304fac3be763016253f7639495da07faeff375df75556a9a389c7e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2939.0.0-darwin-arm64.tar.gz"
      sha256 "a007bfeb6ce5a29fe55640f291313537ac2a33cec7273c03197bfa8df9f642c2"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2939.0.0-linux-x64.tar.gz"
    sha256 "16b0aa1b4cdd145ebe413c3d05d40c53bceb6cf5620534003bc891ae30c52f39"
  end
  version "2939.0.0"
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
