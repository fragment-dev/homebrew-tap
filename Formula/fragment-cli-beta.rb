require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3777.0.0-darwin-x64.tar.gz"
    sha256 "e1fbe9cbf9aa59a189f46e271f43761ed309097bf18a3edd660dc1257875f143"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3777.0.0-darwin-arm64.tar.gz"
      sha256 "e8a628344db1f8e2212a05d8b13b50f4f6bb417bbde47bf54444ca1e68839e1f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3777.0.0-linux-x64.tar.gz"
    sha256 "04b0ba312b09682113e424c2b6468d786ffcdd8a519f4e2160857a38510afb35"
  end
  version "3777.0.0"
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
