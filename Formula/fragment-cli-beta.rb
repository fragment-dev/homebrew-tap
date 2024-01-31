require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4468.0.0-darwin-x64.tar.gz"
    sha256 "24f59c535d739f6269341388facd415232c93dd3400f230023904a9187d734d2"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4468.0.0-darwin-arm64.tar.gz"
      sha256 "48e166cf5840f42e733059607b2d9e5499a7c02e7f19b15d05f5be5f6bb56879"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4468.0.0-linux-x64.tar.gz"
    sha256 "8ed4793daa2d4279f380ec2a04b172526b87a5a5c2fddc87276ec950f03c79a7"
  end
  version "4468.0.0"
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
