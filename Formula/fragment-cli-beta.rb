require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3490.0.0-darwin-x64.tar.gz"
    sha256 "58988baccd790828640e0e2131bd286810181c07bf990ec6b33bc4990991e5c5"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3490.0.0-darwin-arm64.tar.gz"
      sha256 "036e40984c48d22fe0c5ecce7b3081eb3851e3831608a1cbf0491fcad72e3bfc"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3490.0.0-linux-x64.tar.gz"
    sha256 "d194a7580ad198e89729fdc9d406ae85b4e61d1eb049cdb58bb6798183da9ced"
  end
  version "3490.0.0"
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
