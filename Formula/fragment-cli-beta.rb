require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4789.0.0-darwin-x64.tar.gz"
    sha256 "39d8611f1503ddc31cb105514709596be26816c860c0c6651a9e3b496c3d4daa"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4789.0.0-darwin-arm64.tar.gz"
      sha256 "35941bf5939c15d84d44910719558698bad43d5533a1af4d2fc0abe0656105a7"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4789.0.0-linux-x64.tar.gz"
    sha256 "1a9ce829a08fa692a73b4d59b452ad4fc1a86e5f20eb0ecd7d0ce11a40053d89"
  end
  version "4789.0.0"
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
