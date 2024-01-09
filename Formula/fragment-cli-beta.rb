require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4294.0.0-darwin-x64.tar.gz"
    sha256 "dec12c9b48910569dff1eae2cc3df0fa5093cf70e5913b481f528d590c2bddf7"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4294.0.0-darwin-arm64.tar.gz"
      sha256 "e2881a66d5c5727a14473ce1f4c2c28451ad645f982f1990cf28e5ddd3f2d944"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4294.0.0-linux-x64.tar.gz"
    sha256 "302eafb98fd61bc8e89891322b3d53450fe6109e33e3a2a42b3ad359e2f066b6"
  end
  version "4294.0.0"
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
