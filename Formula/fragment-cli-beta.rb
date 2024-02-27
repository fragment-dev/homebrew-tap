require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4644.0.0-darwin-x64.tar.gz"
    sha256 "51fc881536c6d5debe88409849c06775067ac694c4b4bd900c132b71c4b55380"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4644.0.0-darwin-arm64.tar.gz"
      sha256 "e6610f9d10e266877ac79a77b9b71104d7424228fc60a66d1edf27242c5121dc"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4644.0.0-linux-x64.tar.gz"
    sha256 "9bb1481ee7cb83e3d9244d1b7836962678a3e5db02a541c674c8ba0e02996af8"
  end
  version "4644.0.0"
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
