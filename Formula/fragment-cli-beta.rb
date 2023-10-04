require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3759.0.0-darwin-x64.tar.gz"
    sha256 "35c9886819e7aa68c9d17e48b4c9555d1d4034c2fff8d9faad7e4fdd771fa6a8"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3759.0.0-darwin-arm64.tar.gz"
      sha256 "6dd8041154088344937254ea5c7f1440e599f6622d008ba715930639cf059749"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3759.0.0-linux-x64.tar.gz"
    sha256 "2d5f82c724f8fa8de111e6cd0605f4661b7ca2bdbc174c97c5abf0676e9212cc"
  end
  version "3759.0.0"
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
