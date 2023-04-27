require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2539.0.0-darwin-x64.tar.gz"
    sha256 "68c54dba0a6935976d521fdbc5b54efe6d051e024117274b217762252788bc78"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2539.0.0-darwin-arm64.tar.gz"
      sha256 "a3e881cb258574ac0f18d1959399cc0645e02979cc42669a4176de2622d5f59e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2539.0.0-linux-x64.tar.gz"
    sha256 "fca2461458dc1c4318631f9c66e47fbd2f7ec3796e6e8d3021b81ffa7ab26aed"
  end
  version "2539.0.0"
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
