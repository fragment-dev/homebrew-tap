require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4998.0.0-darwin-x64.tar.gz"
    sha256 "c6489661495db64ea926d4301689fa200a71c3bc3ec27cb45981b76a28c41ea8"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4998.0.0-darwin-arm64.tar.gz"
      sha256 "36e5c86efddfe76ff1e25284a38cb6d713818695e4b2d17f684a67c0c20989cd"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4998.0.0-linux-x64.tar.gz"
    sha256 "b5c09ddd8095b0b019312df7904f85ee0f2d6e7998e48e78f4fbadd2d6ddc810"
  end
  version "4998.0.0"
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
