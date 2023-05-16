require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2675.0.0-darwin-x64.tar.gz"
    sha256 "31279e3513562e345c303dc772c6d2df083a3ab270793229ee4c8affae9b46be"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2675.0.0-darwin-arm64.tar.gz"
      sha256 "24035900224a38273c1ea5f44f9e81e5448a2ebfc6e220aa3da25dce7b263d27"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2675.0.0-linux-x64.tar.gz"
    sha256 "5ad44c219db2b09cad94ac02f484fdd402fe9b5da7dc021acf616762640cb472"
  end
  version "2675.0.0"
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
