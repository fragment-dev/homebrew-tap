require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2827.0.0-darwin-x64.tar.gz"
    sha256 "776b373354aad57ef986bddc09346444e9d1bb1c93784764bebb41227de048d3"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2827.0.0-darwin-arm64.tar.gz"
      sha256 "60d54ec336e328b3004c30cc42d86dc94f2679b22f8170d61064c7cad4013684"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2827.0.0-linux-x64.tar.gz"
    sha256 "f5c1cabfbabb76207f6518fb26e2c53c5052fc4f412ab16d538cb1a33cf31e32"
  end
  version "2827.0.0"
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
