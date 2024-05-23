require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5115.0.0-darwin-x64.tar.gz"
    sha256 "1a3ccb314bc2733396b7028e50314d86576b0148b78714159a41dc0fa55940ae"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5115.0.0-darwin-arm64.tar.gz"
      sha256 "d8a8da70a9f5b62c17ed27c2123f1c4bc849c1e49a9c0eb41a1bb589488d3140"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5115.0.0-linux-x64.tar.gz"
    sha256 "a8afe300ba3398a423384fdc7fc0b15c0c0e6b8091af2405f9154826563907f5"
  end
  version "5115.0.0"
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
