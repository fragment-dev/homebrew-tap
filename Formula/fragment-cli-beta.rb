require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5388.0.0-darwin-x64.tar.gz"
    sha256 "e7cefcff2b45da50202fce8f92acf88f59301c89ee756f17783aff7787717497"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5388.0.0-darwin-arm64.tar.gz"
      sha256 "e83d7d9c61212e59fc4c3945bf7f90007aeab053f72373eb45dfbc94c3a94a1d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5388.0.0-linux-x64.tar.gz"
    sha256 "00b3add467b318f85d2d66c3219a072835f237837f92ebf5e2b5f85d5e7d3266"
  end
  version "5388.0.0"
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
