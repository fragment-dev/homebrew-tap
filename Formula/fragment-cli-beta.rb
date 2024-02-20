require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4595.0.0-darwin-x64.tar.gz"
    sha256 "b9a652fb8b4fd97001581d4354615b7ab676da9201d6e07951b5ed2a3ab3213d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4595.0.0-darwin-arm64.tar.gz"
      sha256 "d6c12a4df4d610c73e20049af2471b5e3d003af15bfb0935581c9dcefbdefbdb"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4595.0.0-linux-x64.tar.gz"
    sha256 "95fbbba03a92bc0d18dab96266a18af14cb5abdf8e4071324e4f0a3acdb0c934"
  end
  version "4595.0.0"
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
